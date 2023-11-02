import { Exception } from '@adonisjs/core/build/standalone'

export default class FailureException extends Exception {
    public readonly data?: any
    public readonly error?: any
    public readonly statusCode: string

    constructor(httpStatus: number = 500, statusCode?: string, error?: any, data?: any) {
        super(`A failure with status ${statusCode} returned.`, httpStatus, 'E_HTTP_EXPECTED')
        
        this.error = error;
        this.data = data;
        this.statusCode = statusCode ?? "fail";
    }

    public static notFound(name: string, id: string) {
        return new FailureException(404, `not_found`, `${name} by id ${id} not found`, {
            [`${name}_id`]: id
        })
    }
}   
